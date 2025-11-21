import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/features/commerce/data/datasource/products_remote_datasource/models/products_response_dto.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/entity/product_entity.dart';

@injectable
class ProductsMapper {
  ProductEntity mapProductDtoToEntity(ProductDto productDto) {
    return ProductEntity(
      sold: productDto.sold,
      images: productDto.images,
      ratingsQuantity: productDto.ratingsQuantity,
      id: productDto.id,
      title: productDto.title,
      slug: productDto.slug,
      description: productDto.description,
      quantity: productDto.quantity,
      price: productDto.price,
      priceAfterDiscount: productDto.priceAfterDiscount,
      imageCover: productDto.imageCover,
      ratingsAverage: productDto.ratingsAverage,
    );
  }
}
