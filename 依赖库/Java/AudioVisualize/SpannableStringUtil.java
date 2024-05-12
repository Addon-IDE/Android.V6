package com.mcyi.mcaddon.make;

public class SpannableStringUtil
{
	public static void SetTextView(android.widget.TextView TextView, String AllText, String... Texts)
	{
		if(TextView == null || AllText == null || Texts == null)
			return;
		TextView.setMovementMethod(android.text.method.LinkMovementMethod.getInstance());
		
		for(int Index = 0, HandleNumber = 0, StringEnd = 0, LastStringEnd = 0; Index < Texts.length; Index++)
		{
			StringEnd = AllText.indexOf(Texts[Index]);
			if(StringEnd == 0 || StringEnd == -1)
			{
				if(HandleNumber < Texts.length && Index == Texts.length - 1)
				{
					TextView.append(AllText.substring(LastStringEnd, AllText.length()));
					break;
				}
				else
				{
					continue;
				}
			}
			TextView.append(AllText.substring(LastStringEnd, StringEnd));
			
			android.text.SpannableString SpannableString = new android.text.SpannableString(Texts[Index]);
			SpannableString.setSpan(new ClickableSpan(Texts[Index]), 0, Texts[Index].length(), android.text.SpannableString.SPAN_INCLUSIVE_EXCLUSIVE);
			TextView.append(SpannableString);
			
			LastStringEnd = StringEnd + Texts[Index].length();
			HandleNumber ++;
		}
	}

	public static class ClickableSpan extends android.text.style.ClickableSpan
	{
		public String Text = "114514";

		public ClickableSpan(String $Text)
		{
			if($Text != null)
				Text = $Text;
		}

		@Override
		public void onClick(android.view.View View)
		{
			//android.widget.Toast.makeText(View.getContext(), Text, 0).show();
			OpenUri(View.getContext(), Text);
		}

		@Override
		public void updateDrawState(android.text.TextPaint TextPaint)
		{
			super.updateDrawState(TextPaint);
			TextPaint.setColor(android.graphics.Color.CYAN);
			TextPaint.setUnderlineText(true);
		}
	}

	public static void OpenUri(android.content.Context Context, String Link)
	{
		android.net.Uri Uri = android.net.Uri.parse(Link);
		android.content.Intent Intent = new android.content.Intent(android.content.Intent.ACTION_VIEW, Uri);
		Intent.addFlags(android.content.Intent.FLAG_ACTIVITY_NEW_TASK);
		Context.startActivity(Intent);
	}
}
