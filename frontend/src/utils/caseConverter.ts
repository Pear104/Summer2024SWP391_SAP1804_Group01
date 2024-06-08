export function camelCaseToSentenceCase(camelCaseStr: string) {
  let sentenceCaseStr = camelCaseStr.replace(/([a-z])([A-Z])/g, "$1 $2");
  sentenceCaseStr = sentenceCaseStr.toLowerCase();
  sentenceCaseStr =
    sentenceCaseStr.charAt(0).toUpperCase() + sentenceCaseStr.slice(1);
  return sentenceCaseStr;
}

export function formatPhoneNumber(phoneNo: string) {
  const formatNum =
    phoneNo.slice(0, 3) + "-" + phoneNo.slice(3, 6) + "-" + phoneNo.slice(6);

  return formatNum;
}
