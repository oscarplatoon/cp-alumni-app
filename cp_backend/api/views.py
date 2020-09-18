from django.http import HttpResponseRedirect, JsonResponse, HttpResponse
from .models import User, Cohort, Raffle, RaffleParticipant
from rest_framework import permissions, status
from rest_framework.decorators import api_view, authentication_classes, permission_classes
from rest_framework.response import Response
from rest_framework.views import APIView
from .serializers import UserSerializer, UserSerializerWithToken, RaffleSerializer, RaffleParticipantSerializer
from django.views.decorators.csrf import csrf_exempt
import stripe
import json

@api_view(['GET'])
def current_user(request):
    """
    Determine the current user by their token, and return their data
    """

    serializer = UserSerializer(request.user)
    return Response(serializer.data)


class UserList(APIView):
    """
    Create a new user. It's called 'UserList' because normally we'd have a get
    method here too, for retrieving a list of all User objects.
    """

    permission_classes = (permissions.AllowAny,)

    def post(self, request, format=None):
        serializer = UserSerializerWithToken(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def get(self, request, format=None):
        user_count = User.objects.all().count()
        return Response({'total_users': user_count}, status=status.HTTP_400_BAD_REQUEST)


@authentication_classes([])
@permission_classes([])
class RaffleList(APIView):

    def get(self, request, format=None):
        raffle = Raffle.objects.get(is_active=True)
        serialized_raffle = RaffleSerializer(raffle)
        return Response(serialized_raffle.data)


# STRIPE
# publishable key: pk_test_51HS7wnFVM9KnaWOncRfuXOp4GwbVMtj3bNMuB3oMGuzD0Mg2FyknjVx72MdZejdA6blT0sM1011MAsjbkXUTu3XU00aKBxCC2i

# secret key: sk_test_51HS7wnFVM9KnaWOntonzDB9a2iQ4vvVinUNJ8ORmpUmNIGlfLduKuCz3cGqw9Gu7m8KEPuDFptQaQIyyKbuebl9b00RLf2wLQM
stripe.api_key = 'sk_test_51HS7wnFVM9KnaWOntonzDB9a2iQ4vvVinUNJ8ORmpUmNIGlfLduKuCz3cGqw9Gu7m8KEPuDFptQaQIyyKbuebl9b00RLf2wLQM'

YOUR_DOMAIN = 'http://localhost:3000/raffle/'

@csrf_exempt
def create_checkout_session(request):
    data = json.load(request)
    try:
        checkout_session = stripe.checkout.Session.create(
            payment_method_types=['card'],
            line_items=[
                {
                    'price_data': {
                        'currency': 'usd',
                        'unit_amount': 500,
                        'product_data': {
                            'name': data['raffle'],
                        },
                    },
                    'quantity': data['quantity']
                },
            ],
            mode='payment',
            success_url=YOUR_DOMAIN + '?success=true',
            cancel_url=YOUR_DOMAIN + '?canceled=true',
        )
        sessions = stripe.checkout.Session.list(limit=3)
        print(sessions)
        # print("CHECKOUT SESSION: ", checkout_session)
        response_data = {
            'id': checkout_session.id,
            'customer_email': data['email'],
            'customer': data['name'],
            'raffle': data['raffle']
        }
        # print(response_data)
        return JsonResponse(data=response_data, status=200)
    except Exception as e:
        return JsonResponse(data=str(e), status=403)

def payment_success(request):
    return HttpResponse("Success")

def payment_cancel(request):
    return HttpResponse("Cancelled")
