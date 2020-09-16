from django.http import HttpResponseRedirect
from .models import User, Cohort, Raffle, RaffleParticipant
from rest_framework import permissions, status
from rest_framework.decorators import api_view, authentication_classes, permission_classes
from rest_framework.response import Response
from rest_framework.views import APIView
from .serializers import UserSerializer, UserSerializerWithToken, RaffleSerializer, RaffleParticipantSerializer

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
