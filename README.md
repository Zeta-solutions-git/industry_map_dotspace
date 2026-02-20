brew install cncf/landscape2/landscape2
git clone <https://github.com/cncf/landscape2.git>
cd my-landscape
 landscape2 build \
  --data-file data.yml \
  --settings-file settings.yml \
  --guide-file guide.yml \
  --logos-path logos \
  --output-dir build

landscape2 serve --landscape-dir build
