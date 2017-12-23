I represent an image file, which I can display as thumbnail.

Details: The image file is read and the thumbnail computed by a background process. A step method in the UI process polls to find out when the thumbnail is ready for display, then installs it. This avoids potential race conditions with the UI thread's damage reporting and redisplay mechanism.
