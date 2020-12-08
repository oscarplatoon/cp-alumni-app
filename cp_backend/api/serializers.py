
from rest_framework import serializers
from rest_framework_jwt.settings import api_settings
from .models import User, Cohort, Raffle, RaffleParticipant
from builtins import object



class UsersSerializer(object):
    def __init__(self, body):
        self.body = body

    @property
    def all_users(self):
        output = {'users': []}

        for user in self.body:
            user_detail = {
                'id': user.id,
                'first_name': user.first_name,
                'last_name': user.last_name,
                'email': user.email,
                'is_active': user.is_active,
                'is_verified': user.is_verified,
                'cohort_id': user.cohort_id,
            }
            output['users'].append(user_detail)
        return output

class UserSerializer(serializers.ModelSerializer):

    class Meta:
        model = User
        fields = ('id','first_name', 'last_name', 'email', 'is_staff', 'cohort', 'is_verified','current_company')

    def to_representation(self, instance):
        user_instance = super().to_representation(instance)
        if user_instance['cohort']:
            user_instance['cohort'] = instance.cohort.platoon
            return user_instance
        else:
            user_instance['cohort'] = False
            return user_instance

    def update(self, instance, validated_data):
        """
        Update and return an existing `Snippet` instance, given the validated data.
        """
        instance.first_name = validated_data.get('firstName', instance.first_name)
        instance.last_name = validated_data.get('lastName', instance.last_name)
        instance.email = validated_data.get('email', instance.email)
        instance.cohort = validated_data.get('cohort', instance.cohort)
        instance.current_company = validated_data.get('currentCompany', instance.current_company)
        instance.save()
        return instance

class UserSerializerWithToken(serializers.ModelSerializer):

    token = serializers.SerializerMethodField()
    password = serializers.CharField(write_only=True)

    def get_token(self, obj):
        jwt_payload_handler = api_settings.JWT_PAYLOAD_HANDLER
        jwt_encode_handler = api_settings.JWT_ENCODE_HANDLER

        payload = jwt_payload_handler(obj)
        token = jwt_encode_handler(payload)
        return token

    def create(self, validated_data):
        password = validated_data.pop('password', None)
        instance = self.Meta.model(**validated_data)
        if password is not None:
            instance.set_password(password)
        instance.save()
        return instance

    class Meta:
        model = User
        fields = ('token', 'first_name', 'last_name', 'password', 'email', 'cohort', 'is_verified', 'current_company')


class CohortSerializer(serializers.ModelSerializer):

    class Meta:
        model = Cohort
        fields = ['platoon', 'current_cohort']



class RaffleParticipantSerializer(serializers.ModelSerializer):

    class Meta:
        model = RaffleParticipant
        fields = ['name', 'tickets']

class RaffleSerializer(serializers.ModelSerializer):
    raffle_participants = RaffleParticipantSerializer(many=True, read_only=True)

    class Meta:
        model = Raffle
        fields = ['name', 'amount', 'is_active', 'raffle_participants']

