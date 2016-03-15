import UIKit

struct Filter {
  let filterName: String
  let filterFunction: UIImage -> UIImage
  let filterPreviewImageFile: String
}

let context = CIContext(options:nil)

// MARK: Filters

func applyFilter(filter: CIFilter, toImage image: UIImage) -> UIImage {
  let originalOrientation = image.imageOrientation;
  let originalScale = image.scale
  
  let cgimg = context.createCGImage(filter.outputImage!, fromRect: filter.outputImage!.extent)
  
  return UIImage(CGImage: cgimg, scale: originalScale, orientation: originalOrientation)
}

func vignetteFilter(image: UIImage) -> UIImage {
  let beginImage = CIImage(image: image)
  // FIXME: - substitute with the color
  let parameters: [String : AnyObject]? = [ kCIInputRadiusKey: 0.9, kCIInputIntensityKey: 30, kCIInputImageKey: beginImage!] //, kCIInputColorKey: UIColor.whiteColor()]
  let filter = CIFilter(name: "CIVignette", withInputParameters: parameters)
  
  return applyFilter(filter!, toImage:image)
}

struct Filters {
  static let VignetteFilter = Filter(filterName: "Vignette",  filterFunction: vignetteFilter, filterPreviewImageFile: "testImage.png")
}