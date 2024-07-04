// this program moves screenshots based on the app name in their filename
// an example is `Screenshot_20230113-133316_Twitter.jpg`
// PLAN:
// obtain valid directory path
// for all files in directory,
//	get app name(using substr probably)
// 	move it (by renaming it)to its designated folder, create folder if necessary

#include <filesystem>

#define DEBUG_PRINT 0
#define UNUSED(x) (static_cast<void>(x))

void PrintCmdLineParams(int argc, const char ** const argv)
{
	printf("The command line params are: ");
	for (int i = 0; i < argc; ++i)
		printf("|%s| ", argv[i]);
	printf("\n");
}

int main(int argc, const char **argv)
{
	if (argc < 2)
	{
		printf("Usage: ./ScreenshotSortingProgram.out directory_name\n");
		return 1;
	}

	PrintCmdLineParams(argc, argv);

	std::filesystem::path directoryPath(argv[1]);
	if (!std::filesystem::exists(directoryPath))
	{
		printf("oh hell naw, working directory |%s| doesn't exist!\n", argv[1]);
		return 1;
	}

	std::filesystem::directory_iterator iter(directoryPath);
	for (std::filesystem::directory_entry file : iter)
	{
		// skip directories (other folders that may be chilling in there)
		if (file.is_directory())
			continue;

		std::string filename = file.path().filename();
		if(DEBUG_PRINT)
			printf("filename: |%s|\n", filename.c_str());
		if(DEBUG_PRINT)
			printf("filepath: |%s|\n", file.path().c_str());

		size_t lastUnderscorePos = filename.find_last_of("_");
		size_t lastDotPos = filename.find_last_of(".");
		if (lastUnderscorePos == std::string::npos ||
			lastDotPos == std::string::npos ||
			lastDotPos <= lastUnderscorePos)
		{
			printf("File |%s| needs the following format to create a folder name!\n", filename.c_str());
			printf("\"SomeNameHere_AppName.extension\"\n");
			printf("Continuing to next file...\n");
			continue;
		}

		std::string appName = filename.substr(lastUnderscorePos + 1, lastDotPos - lastUnderscorePos - 1);
		if(DEBUG_PRINT)
			printf("appName: |%s|\n", appName.c_str());

		std::string separator = "/";

		std::string appFolderPathName = directoryPath.string() + separator + appName;
		if(DEBUG_PRINT)
			printf("appFolderPathName: |%s|\n", appFolderPathName.c_str());

		// if the folder doesn't already exist, make one
		if (!std::filesystem::exists(appFolderPathName))
		{
			if (!std::filesystem::create_directory(appFolderPathName))
			{
				printf("oh hell naw, directory |%s| failed to be created!\n", appFolderPathName.c_str());
				printf("Continuing to next file...\n");
				continue;
			}
		}

		std::string newPathString = directoryPath.string() + separator + appName + separator + filename;
		if(DEBUG_PRINT)
			printf("newPathString: |%s|\n", newPathString.c_str());
		std::filesystem::rename(file.path(), newPathString);
		printf("Moved |%s| to |%s|\n", filename.c_str(), appName.c_str());

		if(DEBUG_PRINT)
			printf("========================\n");
	}

	return 0;
}
