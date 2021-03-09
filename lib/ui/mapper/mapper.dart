/// Interface for model mappers. It provides helper methods that facilitate
/// retrieving of models from outer layers
///
/// @param <V> the view input type
/// @param <D> the view model output type
abstract class Mapper<V, D> {
  V mapToViewModel(D type);
  D mapToView(V type);
}
