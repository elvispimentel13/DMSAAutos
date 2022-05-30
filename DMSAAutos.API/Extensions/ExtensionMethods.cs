namespace DMSAAutos.API.Extensions;

public static class ExtensionMethods
{
    private static readonly Regex sWhitespace = new Regex(@"\s+");
    public static string ReplaceWhitespace(string input, string replacement = "")
    {
        return sWhitespace.Replace(input, replacement);
    }
}
