import hls4ml as hls4ml

# Fetch a keras model from our example repository
# This will download our example model to your working directory and return an example configuration file
config = hls4ml.utils.fetch_example_model('KERAS_3layer.json', backend='Vitis')

# You can print the configuration to see some default parameters
print(config)

# Convert it to a hls project
hls_model = hls4ml.converters.keras_v2_to_hls(config)

# Print full list of example models if you want to explore more
hls4ml.utils.fetch_example_list()
# Use Vivado HLS to synthesize the model
# This might take several minutes
hls_model.build()
