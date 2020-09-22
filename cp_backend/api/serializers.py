
from rest_framework import serializers
from rest_framework_jwt.settings import api_settings
from .models import User, Cohort, Raffle, RaffleParticipant


class UserSerializer(serializers.ModelSerializer):

    class Meta:
        model = User
        fields = ('id','first_name', 'last_name', 'email', 'is_staff', 'cohort')

    def to_representation(self, instance):
        user_instance = super().to_representation(instance)
        if user_instance['cohort']:
            user_instance['cohort'] = instance.cohort.platoon
            return user_instance
        else:
            user_instance['cohort'] = False
            return user_instance


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
        fields = ('token', 'first_name', 'last_name', 'password', 'email', 'cohort')

class RaffleParticipantSerializer(serializers.ModelSerializer):

    class Meta:
        model = RaffleParticipant
        fields = ['name', 'tickets']

class RaffleSerializer(serializers.ModelSerializer):
    raffle_participants = RaffleParticipantSerializer(many=True, read_only=True)

    class Meta:
        model = Raffle
        fields = ['name', 'amount', 'is_active', 'raffle_participants']

