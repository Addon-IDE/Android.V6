package com.mcyi.mcaddon.make;

public class ListItemContent
{
	public Item ItemContent = Item.ITEM;
	public String Title = "";
	public String Description = "";
	//public Features FeaturesContent = Features.Picture;

	public static final int TITLE = 0;
	public static final int DESCRIPTION = 1;
	public static final int ITEM = 2;
	public static final int ITEM_WITH_DESCRIPTION = 3;
	public static final int ITEM_WITH_DESCRIPTION_AND_FEATURES = 4;
	public static final int ITEM_WITH_FEATURES = 5;
	public static final int ITEM_WITH_FEATURES_ON_RADIOBUTTON = 6;
	
	public boolean HasPicture = false;
	public boolean HasSwitch = false;
	public boolean HasCheckBox = false;
	public boolean HasRadioButton = false;
	public boolean HasSeekBar = false;

	public android.widget.ImageView ImageView;
	public android.widget.Switch Switch;
	public android.widget.CheckBox CheckBox;
	public android.widget.RadioButton RadioButton;
	public android.widget.SeekBar SeekBar;

	public boolean IsChecked = false;
	public int Progress = 0;
	public int OffsetProgress = 0;
	public int MinProgress = 0;
	public int MaxProgress = 0;

	public Object Tag;
	public int Id;

	public enum Item
	{
		TITLE (0),
		DESCRIPTION (1),
		ITEM (2),
		ITEM_WITH_DESCRIPTION (3),
		ITEM_WITH_DESCRIPTION_AND_FEATURES (4),
		ITEM_WITH_FEATURES (5),
		ITEM_WITH_FEATURES_ON_RADIOBUTTON (6);

		final int Int;

		@SuppressWarnings(
		{
			"deprecation"
		})
		public static Item Configs[] =
		{
			TITLE, DESCRIPTION, ITEM, ITEM_WITH_DESCRIPTION, ITEM_WITH_DESCRIPTION_AND_FEATURES, ITEM_WITH_FEATURES, ITEM_WITH_FEATURES_ON_RADIOBUTTON
		};

		Item(int $Int)
		{
			Int = $Int;
		}
	}

	/*public enum Features
	{
		Picture (0),
		Switch (1),
		CheckBox (2),
		RadioButton (3),
		SeekBar (4);

		final int Int;

		@SuppressWarnings(
		{
			"deprecation"
		})
		public static Features Configs[] =
		{
			Picture, Switch, CheckBox, RadioButton, SeekBar
		};

		Features(int $Int)
		{
			Int = $Int;
		}
	}*/
}
