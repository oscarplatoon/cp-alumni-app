from django.http import HttpResponseRedirect, JsonResponse, HttpResponse
from .models import User, Cohort, Raffle, RaffleParticipant
from rest_framework import permissions, status
from rest_framework.decorators import api_view, authentication_classes, permission_classes
from rest_framework.response import Response
from django.http import Http404
from rest_framework.views import APIView
from .serializers import UserSerializer, UserSerializerWithToken, RaffleSerializer, RaffleParticipantSerializer, CohortSerializer, UsersSerializer
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

@api_view(['GET'])
def get_total_users_count(request):
    user_count = User.objects.all()
    return Response({'total_users': user_count}, status=200)

class UserDetail(APIView):

    def get_object(self, pk):
        try:
            return User.objects.get(id=pk)
        except User.DoesNotExist:
            raise Http404

    def put(self, request, format=None):
        user = self.get_object(request.data['id'])
        if user.cohort != request.data['cohort']:
            request.data['cohort'] = Cohort.objects.get(platoon=request.data['cohort'])
        serializer = UserSerializer.update(self, user, request.data)
        if serializer:
            return Response({'message':'Successfully updated User Profile'})
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

# Retreives all Users from Database
class AllUsersList(APIView):

    permission_classes = (permissions.AllowAny,)

    def get(self, request, format=None):
        all_users = User.objects.all()
        serialized_users = UsersSerializer(all_users).all_users
        return Response({'all_users': serialized_users}, status=200)

# Creates new user and gets user
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
        return Response({'total_users': user_count}, status=200)


@authentication_classes([])
@permission_classes([])
class CohortList(APIView):

    def get(self, request, format=None):
        cohorts = Cohort.objects.all()
        serialized_cohorts = CohortSerializer(cohorts, many=True)
        return Response(serialized_cohorts.data)


@authentication_classes([])
@permission_classes([])
class RaffleList(APIView):

    def get(self, request, format=None):
        raffle = Raffle.objects.get(is_active=True)
        serialized_raffle = RaffleSerializer(raffle)
        return Response(serialized_raffle.data)



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
        response_data = {
            'id': checkout_session.id,
            'customer_email': data['email'],
            'customer': data['name'],
            'raffle': data['raffle']
        }
        return JsonResponse(data=response_data, status=200)
    except Exception as e:
        return JsonResponse(data=str(e), status=403)

def payment_success(request):
    return HttpResponse("Success")

def payment_cancel(request):
    return HttpResponse("Cancelled")
