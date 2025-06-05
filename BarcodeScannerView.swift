import SwiftUI
import AVFoundation

/// A simple SwiftUI wrapper for `AVCaptureSession` based barcode scanning.
///
/// The session starts running when the view appears and stops when the view
/// controller is deinitialized (e.g. when the sheet presenting it is dismissed).
struct BarcodeScannerView: UIViewControllerRepresentable {
    func makeCoordinator() -> Coordinator { Coordinator() }

    func makeUIViewController(context: Context) -> ScannerViewController {
        let controller = ScannerViewController()
        controller.session = context.coordinator.session
        return controller
    }

    func updateUIViewController(_ uiViewController: ScannerViewController, context: Context) {}

    static func dismantleUIViewController(_ uiViewController: ScannerViewController, coordinator: Coordinator) {
        // Ensure the session stops if the view is removed unexpectedly.
        coordinator.session.stopRunning()
    }

    // MARK: - Coordinator
    class Coordinator: NSObject, AVCaptureMetadataOutputObjectsDelegate {
        let session = AVCaptureSession()

        override init() {
            super.init()
            configureSession()
        }

        private func configureSession() {
            guard let device = AVCaptureDevice.default(for: .video),
                  let input = try? AVCaptureDeviceInput(device: device) else { return }
            if session.canAddInput(input) {
                session.addInput(input)
            }

            let output = AVCaptureMetadataOutput()
            if session.canAddOutput(output) {
                session.addOutput(output)
                output.setMetadataObjectsDelegate(self, queue: .main)
                output.metadataObjectTypes = [.ean8, .ean13, .qr]
            }
        }

        func metadataOutput(_ output: AVCaptureMetadataOutput,
                            didOutput metadataObjects: [AVMetadataObject],
                            from connection: AVCaptureConnection) {
            // Handle scanned codes here.
        }
    }
}

// MARK: - UIKit hosting view controller
class ScannerViewController: UIViewController {
    var session: AVCaptureSession?
    private var previewLayer: AVCaptureVideoPreviewLayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        if let session {
            let layer = AVCaptureVideoPreviewLayer(session: session)
            layer.videoGravity = .resizeAspectFill
            layer.frame = view.layer.bounds
            view.layer.addSublayer(layer)
            previewLayer = layer
            session.startRunning()
        }
    }

    deinit {
        // Stop the capture session when the sheet is dismissed
        session?.stopRunning()
    }
}
