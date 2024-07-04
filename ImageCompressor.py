'''
This program compresses all .jpeg/.jpg/.png files in a chosen folder using the TinyPNG API.
'''
import tinify # the tinypng API
import os # for folder and file stuff
import sys # for getting command line args

# SET THIS TO TRUE TO ACTUALLY COMPRESS FILES
USE_COMPRESSION = True #False

def Compress(filename):
	try: # Use the Tinify API client.
		compressions_this_month = tinify.compression_count
		print("compressions so far: %d" % compressions_this_month)
		if (compressions_this_month >= 499):
			print("Stopping due to maximum of 500 compressions!")
			return

		if USE_COMPRESSION:
			print("Compressing |%s|..." % filename)
			source = tinify.from_file(filename)
			source.to_file(filename)
			print("|%s| has been compressed!" % filename)

	except tinify.AccountError as e:
		print("Verify your API key and account limit.")
		print("The error message is: %s" % e.message)
	except tinify.ClientError as e:
		print("Check your source image and request options.")
		print("The error message is: %s" % e.message)
	except tinify.ServerError as e:
		print("Temporary issue with the Tinify API.")
		print("The error message is: %s" % e.message)
	except tinify.ConnectionError as e:
		print("A network connection error occurred.")
		print("The error message is: %s" % e.message)
	except Exception as e:
		print("Something else went wrong, unrelated to the Tinify API.")

def main():
	if len(sys.argv) < 2:
		print("Usage: python3 ImageCompressor.py directory_name\n")
		exit()

	try:
		tinify.key = "PLEASE_GET_YOUR_OWN_KEY"
		tinify.validate()
	except tinify.Error as e:
		print("Validation of API key failed.")
		print("The error message is: %s" % e.message)
		exit()

	folderName = sys.argv[1]

	# get all file and folder names in folder
	try:
		directoryList = os.listdir(folderName)
	except FileNotFoundError as e:
		print("The folder |%s| cannot be found, terminating program." % folderName)
		exit()

	separator = "/"
	filenames = []

	# obtain only .jpg/.jpeg/.png files
	for filename in directoryList:
		if (filename.endswith(".jpg") or filename.endswith(".jpeg") or
			filename.endswith(".png")):
			filenames.append(folderName + separator + filename)

	counter = 0
	# compress each file
	for filename in filenames:
		Compress(filename)
		counter += 1

	if True: #USE_COMPRESSION:
		print("Performed {0} compressions on {1} files".format(counter, len(filenames)))

if __name__ == "__main__":
    main()
