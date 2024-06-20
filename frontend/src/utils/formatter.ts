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

export const formatDate = (dateString: any) => {
  const date = new Date(dateString);
  const day = String(date.getDate()).padStart(2, "0");
  const month = String(date.getMonth() + 1).padStart(2, "0");
  const year = date.getFullYear();
  const hours = String(date.getHours()).padStart(2, "0");
  const minutes = String(date.getMinutes()).padStart(2, "0");
  return `${hours}:${minutes}, ${day}/${month}/${year}`;
};

export const formatAvatarName = (sentence: string) => {
  const words = sentence.split(" ");
  let result = "";
  words.forEach((word) => {
    result += word.charAt(0);
  });
  return result.slice(0, 2);
};
