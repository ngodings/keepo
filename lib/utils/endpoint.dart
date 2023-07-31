// ========================== Login Register ================================
const String registerUrl = '/register';
const String loginUrl = '/login';
const String kycUrl = '/kyc';
const String verificationUrl = '/kyc/verification';
const String sendOtpUrl = '/otp';
const String getProfile = '/get_profile';
const String getPrivacyUrl = '/admin/privacy';
const String getTermsUrl = '/admin/terms';
const String logoutUrl = '/logout';

// ========================== Socket Chat ================================
const String getContactListListen = 'contact_list';
const String getMessageListen = 'get_message';
const String connectRoomSocket = 'connect_room';
const String getMessagingMessageSocket = 'get_messaging_message';
const String sendMessageSocket = 'send_messaging_message';
const String editMessageSocket = 'edit_messaging_message';
const String deleteMessageSocket = 'delete_messaging_message';
const String deleteChatSocket = 'delete_message';
const String newMessage = '/find/profile';
const String quitSocket = 'quit';
const String joinGroupSocket = 'join_group';
const String uploadMedia = '/upload/document/messaging';
const String updateFCM = 'update_fcm';

// ========================== Socket Group Chat ================================
const String createGroupUrl = 'create_group';
const String checkJoinGroupSocket = 'check_join_group';
const String setPinGroupMessageSocket = 'set_pin_message_group';
const String getPinGroupMessageSocket = 'get_pin_message_group';
const String findMessagePageIndexSocket = 'find_page_message_group';
const String getMessageGroupListen = 'get_group_message';
const String getNewMessageGroupListen = 'new_group_message';
const String getPinnedMessageListen = 'pinned_message';
const String getMessagingGroupMessage = 'get_messaging_group_message';
const String sendMessagingGroupMessage = 'send_messaging_group_message';
const String getParticipantGroupUrl = 'get_group_participant';
const String exitGroupUrl = 'quit';
const String setAdminUrl = 'set_admin';
const String editGroupUrl = 'edit_group';
const String inviteGroupUrl = 'invite';
const String removeMemberUrl = 'remove_participant';
const String removeAdminUrl = 'remove_admin';
const String deleteGroupUrl = 'leave_group';

const String editGroupLinkUrl = "/chat/group/link";
const String groupChatMediaUrl =
    '/chat/media'; //---- ENDPOINT API FOR GETTING GROUP CHAT MEDIA
const String findGroupChat =
    '/chat/group/find'; //---- ENDPOINT API FOR FINDING CHAT

// ========================== Wallet ================================
const String fiatBalanceUrl = 'wallet/fiat';
const String addBankAccountUrl = 'deposit/fiat/bank';
const String getDepositInfoUrl = 'deposit/fiat/bank';
const String addDepositInfoUrl = 'wallet/fiat/deposit';
const String addDepositFiatCurrencyUrl = 'wallet/fiat/deposit/';
const String addRateUrl = 'swap/fiat';
const String addSwapUrl = 'swap/fiat';
const String addTransferUrl = 'fiat/transfer';

// ========================== Account ================================
const String accountUrl = '/user/account';
const String createAccountUrl = '/user/account';
const String editAccountUrl = '/user/account';
const String deleteAccountUrl = '/user/account/soft';
const String settingAccountUrl = '/user/account/setting';
const String getAccountUrl = '/user/account';
const String switchingUrl = '/user/switching';
const String checkPasscodeUrl = '/user/account/passcode';
const String deleteUserUrl = '/delete_temporary';
const String referalAccountUrl = '/user/account/referal';
const String emailOtpUrl = '/user/account/otp';
const String changeAddPhoneUrl = '/account/phone/add';
const String verifPhoneUrl = '/account/phone/update';
const String requestEmailOtpForDeleteUrl = '/user/account/delete/otp/request';
const String checkEmailOtpForDeleteUrl = '/user/account/delete/otp';

// ========================== Social Login ================================

const String socialUrl = '/social';
const String connectSocialUrl = '/social/connect';
const String disconnectSocialUrl = '/social/disconnect';
const String replaceSocialUrl = '/social/replace';

// ========================== Payment Pin ================================

const String paymentPinUrl = '/user/payment/pin';
const String checkPaymentPinUrl = '/user/payment/pin/check';

// ========================== Transaction ================================

const String transactionHistoryUrl = '/order/history';
const String transactionDetailUrl = '/order/detail';
const String requestEmailOtpUrl = '/payment/otp/request';

const String userBankInfoUrl = '/user/bank';
const String digitalAssetsUrl = '/user/assets';
const String viewLockedZENUrl = '/order/seller/earnings';

// ========================== Profile ================================
const String profileDetailsUrl = '/user/profile';
const String createProfileUrl = '/user/profile';
const String editProfileUrl = '/user/profile';
const String addMediaUrl = '/user/profile/file';
const String setMediaAsDefaultPicUrl = '/user/profile/file/default';
const String addExperiencesUrl = '/user/experiences';
const String getExperiencesUrl = '/user/experiences';
const String addFamilyUrl = '/user/family/add';
const String findFamilyUrl = '/user/family';
const String findProfileByIdUrl = '/find/profile';
const String copyProfileUrl = '/user/profile/copy';
const String validateUsernameUrl = '/validate/username';

const String findMatchingKeywordUrl = '/find/matching';
const String findTopMatchUrl = '/matching/top';
const String profileFavorites = '/user/favorites';
const String deleteAllMediaUrl = '/user/profile/file/all';
const String deleteAllExperienceUrl = '/user/experiences/all';
const String deleteAllFamilyUrl = '/user/family/all';

const String serviceProductURl = '/user/product';
const String serviceProductMediaURl = '/user/product/media';

const String tncBooking = '/user/agreement';

// ========================== Contact or Friend ================================
const String friends = '/user/friend';
const String findFriendUrl = '/user/profile/find';
const String profileExplore = '/user/profile/explore';
const String blockUrl = '/user/block';
const String friendImageUpload = '/user/friend/upload';
const String friendDesc = '/user/friend/detail';

// ========================== Privacy Setting ================================
const String privacySettingUrl = '/user/profile/settings';
const String keywordPrivacySettingUrl = '/user/profile/settings/keyword';
const String settingMacthingUrl = '/user/profile/setting';

const String privacyUrl = '/user/settings/privacy';
const String preferenceUrl = '/user/settings/preferences';
const String preferenceResetUrl = '/user/settings/preferences/reset';

const String reportUrl = '/user/reporting';

// ========================== KYC REGISTRATION ================================
const String kycPersonalInformationUrl = '/user/kyc';
const String kycPassportIDCardProofUrl = '/user/kyc/id-card';
const String kycPersonalResidenceProofUrl = '/user/kyc/residence';
const String kycPersonalSelfieProofUrl = '/user/kyc/selfie';
const String kycBusinessCertificateUrl = '/user/kyc/bussiness-certification';
const String kycBusinessAddressUrl = '/user/kyc/bussiness-address';

const String kycBusinessBeneficiaryPersonalInfoUrl = '/user/kyc/beneficiary';
const String kycBusinessBeneficiaryIDCardPassportUrl =
    '/user/kyc/beneficiary/id-card';
const String kycBusinessBeneficiaryProofResidenceUrl = '/user/kyc/residence';
const String kycBusinessBeneficiarySelfieUrl = '/user/kyc/selfie';
const String kycBusinessBeneficiaryArray = '/user/kyc/beneficiary/array';
const String kycBusinessBeneficiaryDelete = '/user/kyc/beneficiary';

const String kycBusinessBearerPersonalInfoUrl = '/user/kyc/bearer';
const String kycBusinessBearerIDCardPassportUrl = '/user/kyc/bearer/id-card';
const String kycBusinessBearerProofResidenceUrl = '/user/kyc/bearer/residence';
const String kycBusinessBearerSelfieUrl = '/user/kyc/bearer/selfie';

// ========================== REN ================================
const String getRenTierList = '/billing/ren-tier';
const String buyRenUrl = '/order/buy/ren';
const String paymentRatesUrl = '/payment/rates';
const String depositRate = '/billing/deposit-rate';
const String cancelOrderUrl = '/order/cancel';
const String checkBillRateUrl = '/billing/payment-channels';

// ========================== Booking ================================
const String orderBookingUrl = '/order/boking/service';
const String orderSellerHistoryUrl = '/order/seller';
const String orderSellerAcceptUrl = '/order/seller/accept';
const String orderSellerRejectUrl = '/order/seller/reject';
const String orderDetailSellerUrl = '/order/seller/detail';
const String orderEditSellerUrl = '/order/seller/edit';
const String orderDetailBuyerUrl = '/order/detail';
const String orderCancelUrl = '/order/cancel';
const String orderAcceptUrl = '/order/accept';
const String orderConfirmUrl = '/order/confirm';
const String orderEditBuyerUrl = '/order/edit';
const String requestWithdrawUrl = '/withdraw';
const String orderTippingUrl = '/order/tipping';

// ========================== Booking ================================
const String notifications = 'user/notification';
const String deleteNotifications = 'user/notification/delete';

//=========================== matches =============================
const String findMatchingProfileUrl = '/matching/profile';
const String findServicesUrl = '/matching/service';
const String findGroupUrl = '/matching/group';
