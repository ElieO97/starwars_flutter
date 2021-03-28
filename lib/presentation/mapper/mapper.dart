/// Interface for model mappers. It provides helper methods that facilitate
/// retrieving of models from outer layers
///
/// @param <V> the view model input type
/// @param <D> the domain model output type
abstract class Mapper<V, D> {
  V mapToView(D type);
}
