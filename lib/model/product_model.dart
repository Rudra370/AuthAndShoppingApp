class ProductModel {
	String? topCategoryId;
	String? topCategoryName;
	String? image;
	String? backgroundColor;
	String? textColor;
	String? numberItem;
	String? showOnMenu;
	String? productCount;

	ProductModel({
		this.topCategoryId, 
		this.topCategoryName, 
		this.image, 
		this.backgroundColor, 
		this.textColor, 
		this.numberItem, 
		this.showOnMenu, 
		this.productCount, 
	});

	factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
				topCategoryId: json['TopCategoryId'] as String?,
				topCategoryName: json['TopCategoryName'] as String?,
				image: json['Image'] as String?,
				backgroundColor: json['BackgroundColor'] as String?,
				textColor: json['TextColor'] as String?,
				numberItem: json['NumberItem'] as String?,
				showOnMenu: json['ShowOnMenu'] as String?,
				productCount: json['ProductCount'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'TopCategoryId': topCategoryId,
				'TopCategoryName': topCategoryName,
				'Image': image,
				'BackgroundColor': backgroundColor,
				'TextColor': textColor,
				'NumberItem': numberItem,
				'ShowOnMenu': showOnMenu,
				'ProductCount': productCount,
			};

	ProductModel copyWith({
		String? topCategoryId,
		String? topCategoryName,
		String? image,
		String? backgroundColor,
		String? textColor,
		String? numberItem,
		String? showOnMenu,
		String? productCount,
	}) {
		return ProductModel(
			topCategoryId: topCategoryId ?? this.topCategoryId,
			topCategoryName: topCategoryName ?? this.topCategoryName,
			image: image ?? this.image,
			backgroundColor: backgroundColor ?? this.backgroundColor,
			textColor: textColor ?? this.textColor,
			numberItem: numberItem ?? this.numberItem,
			showOnMenu: showOnMenu ?? this.showOnMenu,
			productCount: productCount ?? this.productCount,
		);
	}
}
