export function camelCaseToSentenceCase(camelCaseStr: string) {
  let sentenceCaseStr = camelCaseStr.replace(/([a-z])([A-Z])/g, "$1 $2");
  sentenceCaseStr = sentenceCaseStr.toLowerCase();
  sentenceCaseStr =
    sentenceCaseStr.charAt(0).toUpperCase() + sentenceCaseStr.slice(1);
  return sentenceCaseStr;
}
