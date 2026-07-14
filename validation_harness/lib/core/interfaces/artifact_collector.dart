abstract class ArtifactCollector {
  Future<String> captureScreenshot(String name);
  Future<void> startVideoRecording();
  Future<String?> stopVideoRecording();
}
