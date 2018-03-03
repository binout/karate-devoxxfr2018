mkdir -p output

echo "Generate slides"
docker run --rm -v $(pwd):/slides amouat/decktape deck https://binout.github.io/karate-devoxxfr2018/  /slides/output/slides.pdf
