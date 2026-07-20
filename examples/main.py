import hls4ml as hls4ml

# Fetch a keras model from our example repository
config = hls4ml.utils.fetch_example_model(
    'KERAS_3layer.json',
    backend='Vitis'
)

# Print the configuration
print(config)

# Convert it to an HLS project
hls_model = hls4ml.converters.keras_v2_to_hls(config)

# Print available example models
hls4ml.utils.fetch_example_list()

# Build the Vitis HLS project
hls_model.build()

# Launch LightningSim
hls4ml.run_lightningsim()