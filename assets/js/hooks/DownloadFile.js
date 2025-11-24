export default {
  mounted() {
    this.handleEvent("download_file", ({ filename, binary }) => {
      const link = document.createElement("a")
      link.href = "data:application/pdf;base64," + binary
      link.download = filename
      link.click()
    })
  }
}


