//=================Error Messages==================
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';

const String kErrorCantReachServer = "Can't reach to the http server";
const String kErrorException = "Terjadi kesalahan. Coba lagi";
const String kConnectionTimeout = "Connection Timeout";
const String kNoInternetConnection = "No Internet Connection";
const String errorMsg = "Ops, something went wrong, please try again!";
const String successMsg = "Success!";

//=================Const Storage==================
const String tokenUser = 'token';
const String accountId = 'id_account';
const String accessToken = 'access_token';
const String paymentPin = 'payment_pin';
const String profileId = 'id_profile';
const String passcodeAccount = 'passcode_acc';
const String profileDummyData = 'profile_dummy_data';
const String statusAccountUser = 'status_account';
const String profileThumbnail = 'profile_thumbnail';
const String hasProfile = 'last_edit';
const String listProfile = 'list_profile';
const String listAccount = 'list_account';
const String lastEdit = 'lastEdit';
const String activeUsernameProfile = 'active_username_profile';
const String activeUsernameAccount = 'active_username_account';
const String testNull = 'test_null';
const String long = 'longitude';
const String lat = 'latitude';
const String sumContact = 'sum_contact';
const String friendList = 'friend_list';
const String sumContactSelected = 'list_contact';
const String dialCodeStorage = 'dial_code';
const String switchMacth = 'switch_match';
const String switchPrivacy = 'switch_privacy';
const String listKeyword = 'list_keywords';
const String listThumbnail = 'list_thumbnail';
const String mediaUser = 'media_user';
const String experienceUser = 'experience_user';
const String familyUser = 'family_user';
const String kycId = 'kyc_id';
const String emailAccount = 'email_acc';
const String savingKYCData = 'saving_kyc_data';
const String savingKYCIndividualData = 'kyc_individual_data';
const String savingKYCBusinessData = 'kyc_business_data';
const String savingKYCBeneficiariesData = 'kyc_beneficiaries_data';
const String savingKYCBearerData = 'kyc_bearer_data';
const String savingKYCPersonalFilePath = 'kyc_personal_file_path';
const String rateSGDtoRen = 'rate_sgd_to_ren';
const String rateZENtoSGD = 'rate_zen_to_sgd';
const String tncBookingService = 'tnc_booking_serice';
const String tncBookingServiceValue = 'tnc_booking_serice_agreed';
const String draftService = 'draft_service';
const String saveLastSelectedPaymentMethod = 'saveLastSelectedPaymentMethod';
const String saveNotificationStatus = 'saveNotificationStatus';
const String statusKYCVerifed = 'kyc_verified';
const String saveOnBoarding = 'save_onboarding';
const String saveAllKeywords = 'save_all_keywords';
const String socialProvider = 'social_provider';
const String bannedWords = 'banned_words';

const String serverTime = 'serverTime';
const String saveWhenDenyLocPermission = 'saveWhenDenyLocPermission';
const String saved = 'saved';
const String currency = 'SGD';

const String versionApp = '1.2.2';

const String vapidKey =
    'BL84rqnuyh2vNjFIs2NECmyTXfy-VXtWcsHzdV5UTMGwbF-nDKX4TgWhCYwXib773KGtV6wrYPMZkiFbIdHfnOc';
String mapsKey = Platform.isIOS
    ? 'AIzaSyBZi4I-z5Lym1S8Z9V3h4PdBbGVrpecnfg'
    : Platform.isAndroid
        ? 'AIzaSyCcYCPyJKPbaSnY54bE_sjHpe8Xv3BJ4cc'
        : '';

//CONST FLAVOR
const String baseUrlSocketServer = 'baseUrlSocketServer';

const String inviteRefferal = "";

// ------ PERMISSION TEXT -------
String locationDenied = "location_denied".tr();
String locationDeniedPermanently = "location_denied_permanently".tr();
String locationDisabled = "location_disabled".tr();
String contactDenied = "contact_denied".tr();
String microphoneDenied = "microphone_denied".tr();
String photoDenied = "photo_denied".tr();
String cameraDenied = "camera_denied".tr();
String photoGiveFullAccess = "photo_full_access".tr();
String cameraNotFound = "camera_not_found".tr();
String fileSizeLimit = "file_size_limit".tr();

// ------ CONSTANT INSTAGRAM ------
String clientId = "538520988420871";
String clientSecret = "bbb23694129df132945e4d602b49e7a2";
String redirectUrl = "https://keepo.ai/login-instagram-success";
String scope = 'user_profile,user_media';
String responseType = 'code';
String urlGetAccessToken = 'https://api.instagram.com/oauth/access_token';

String urlGetAuthorizeToken =
    'https://api.instagram.com/oauth/authorize?client_id=$clientId&redirect_uri=$redirectUrl&scope=$scope&response_type=$responseType';

String imageHandler =
    "https://images.unsplash.com/photo-1678355964547-d23bde056f9a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1974&q=80";
