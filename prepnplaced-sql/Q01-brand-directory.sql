SELECT DISTINCT Brand
FROM read_files(
    '/Volumes/workspace/prepnplaced/raw/Products.csv',
    format => 'csv', header => true)
ORDER BY Brand; 
