#!/bin/sh

BASEDIR=`pwd`

if [ ! -d "$BASEDIR" ]; then
    mkdir "$BASEDIR"
fi


# toy (testing dataset)
if [ ! -d "$BASEDIR/toy" ]; then
    echo Downloading toy
    cd $BASEDIR
    curl -O http://web.informatik.uni-mannheim.de/pi1/kge-datasets/toy.tar.gz
    tar xvf toy.tar.gz
else
    echo toy already present
fi
if [ ! -f "$BASEDIR/toy/dataset.yaml" ]; then
    python preprocess.py toy
else
    echo toy already prepared
fi


# fb15k
if [ ! -d "$BASEDIR/fb15k" ]; then
  echo Downloading fb15k
  cd $BASEDIR
  curl -O http://web.informatik.uni-mannheim.de/pi1/kge-datasets/fb15k.tar.gz
  tar xvf fb15k.tar.gz
  cd fb15k
  case "$(uname -s)" in
      CYGWIN*|MINGW32*|MSYS*)
          cmd.exe /c mklink train.txt freebase_mtr100_mte100-train.txt
          cmd.exe /c mklink valid.txt freebase_mtr100_mte100-valid.txt
          cmd.exe /c mklink test.txt freebase_mtr100_mte100-test.txt
          ;;
      *)
          ln -s freebase_mtr100_mte100-train.txt train.txt
          ln -s freebase_mtr100_mte100-valid.txt valid.txt
          ln -s freebase_mtr100_mte100-test.txt test.txt
          ;;
  esac
  cd ..
else
    echo fb15k already present
fi
if [ ! -f "$BASEDIR/fb15k/dataset.yaml" ]; then
    python preprocess.py fb15k
else
    echo fb15k already prepared
fi

# fb15k-237
if [ ! -d "$BASEDIR/fb15k-237" ]; then
  echo Downloading fb15k-237
  cd $BASEDIR
  curl -O http://web.informatik.uni-mannheim.de/pi1/kge-datasets/fb15k-237.tar.gz
  tar xvf fb15k-237.tar.gz
else
    echo fb15k-237 already present
fi
if [ ! -f "$BASEDIR/fb15k-237/dataset.yaml" ]; then
  python preprocess.py fb15k-237
else
    echo fb15k-237 already prepared
fi

# wn18
if [ ! -d "$BASEDIR/wn18" ]; then
  echo Downloading wn18
  cd $BASEDIR
  curl -O http://web.informatik.uni-mannheim.de/pi1/kge-datasets/wn18.tar.gz
  tar xvf wn18.tar.gz
  cd wn18
  case "$(uname -s)" in
      CYGWIN*|MINGW32*|MSYS*)
          cmd.exe /c mklink train.txt wordnet-mlj12-train.txt
          cmd.exe /c mklink valid.txt wordnet-mlj12-valid.txt
          cmd.exe /c mklink test.txt wordnet-mlj12-test.txt
          ;;
      *)
          ln -s wordnet-mlj12-train.txt train.txt
          ln -s wordnet-mlj12-valid.txt valid.txt
          ln -s wordnet-mlj12-test.txt test.txt
          ;;
  esac
  cd ..
else
    echo wn18 already present
fi
if [ ! -f "$BASEDIR/wn18/dataset.yaml" ]; then
  python preprocess.py wn18
else
    echo wn18 already prepared
fi

# wnrr
if [ ! -d "$BASEDIR/wnrr" ]; then
  echo Downloading wnrr
  cd $BASEDIR
  curl -O http://web.informatik.uni-mannheim.de/pi1/kge-datasets/wnrr.tar.gz
  tar xvf wnrr.tar.gz
else
    echo wnrr already present
fi
if [ ! -f "$BASEDIR/wnrr/dataset.yaml" ]; then
  python preprocess.py wnrr
else
    echo wnrr already prepared
fi


# dbpedia50
if [ ! -d "$BASEDIR/dbpedia50" ]; then
  echo Downloading dbpedia50
  cd $BASEDIR
  curl -O http://web.informatik.uni-mannheim.de/pi1/kge-datasets/dbpedia50.tar.gz
  tar xvf dbpedia50.tar.gz
else
    echo dbpedia50 already present
fi
if [ ! -f "$BASEDIR/dbpedia50/dataset.yaml" ]; then
  python preprocess.py dbpedia50
else
    echo dbpedia50 already prepared
fi

# dbpedia500
if [ ! -d "$BASEDIR/dbpedia500" ]; then
  echo Downloading dbpedia500
  cd $BASEDIR
  curl -O http://web.informatik.uni-mannheim.de/pi1/kge-datasets/dbpedia500.tar.gz
  tar xvf dbpedia500.tar.gz
else
    echo dbpedia500 already present
fi
if [ ! -f "$BASEDIR/dbpedia500/dataset.yaml" ]; then
  python preprocess.py dbpedia500 --order_sop
else
    echo dbpedia500 already prepared
fi

# db100k
if [ ! -d "$BASEDIR/db100k" ]; then
  echo Downloading db100k
  cd $BASEDIR
  curl -O http://web.informatik.uni-mannheim.de/pi1/kge-datasets/db100k.tar.gz
  tar xvf db100k.tar.gz
  cd db100k
  case "$(uname -s)" in
      CYGWIN*|MINGW32*|MSYS*)
          cmd.exe /c mklink train.txt _train.txt
          cmd.exe /c mklink valid.txt _valid.txt
          cmd.exe /c mklink test.txt _test.txt
          ;;
      *)
          ln -s _train.txt train.txt
          ln -s _valid.txt valid.txt
          ln -s _test.txt test.txt
          ;;
  esac
  cd ..
else
    echo db100k already present
fi
if [ ! -f "$BASEDIR/db100k/dataset.yaml" ]; then
  python preprocess.py db100k
else
    echo db100k already prepared
fi

# yago3-10
if [ ! -d "$BASEDIR/yago3-10" ]; then
  echo Downloading yago3-10
  cd $BASEDIR
  curl -O http://web.informatik.uni-mannheim.de/pi1/kge-datasets/yago3-10.tar.gz
  tar xvf yago3-10.tar.gz
else
    echo yago3-10 already present
fi
if [ ! -f "$BASEDIR/yago3-10/dataset.yaml" ]; then
  python preprocess.py yago3-10
else
    echo yago3-10 already prepared
fi

# wikidata5m
if [ ! -d "$BASEDIR/wikidata5m" ]; then
  echo Downloading wikidata5m
  cd $BASEDIR
  curl -O http://web.informatik.uni-mannheim.de/pi1/kge-datasets/wikidata5m.tar.gz
  tar xvf wikidata5m.tar.gz
else
    echo wikidata5m already present
fi
if [ ! -f "$BASEDIR/wikidata5m/dataset.yaml" ]; then
  python preprocess.py wikidata5m
else
    echo wikidata5m already prepared
fi

# kinship
if [ ! -d "$BASEDIR/kinship" ]; then
  echo Downloading kinship
  cd $BASEDIR
  curl -O http://web.informatik.uni-mannheim.de/pi1/kge-datasets/kinship.tar.gz
  tar xvf kinship.tar.gz
else
    echo kinship already present
fi
if [ ! -f "$BASEDIR/kinship/dataset.yaml" ]; then
  python preprocess.py kinship
else
    echo kinship already prepared
fi

# nations
if [ ! -d "$BASEDIR/nations" ]; then
  echo Downloading nations
  cd $BASEDIR
  curl -O http://web.informatik.uni-mannheim.de/pi1/kge-datasets/nations.tar.gz
  tar xvf nations.tar.gz
else
    echo nations already present
fi
if [ ! -f "$BASEDIR/nations/dataset.yaml" ]; then
  python preprocess.py nations
else
    echo nations already prepared
fi

# umls
if [ ! -d "$BASEDIR/umls" ]; then
  echo Downloading umls
  cd $BASEDIR
  curl -O http://web.informatik.uni-mannheim.de/pi1/kge-datasets/umls.tar.gz
  tar xvf umls.tar.gz
else
    echo umls already present
fi
if [ ! -f "$BASEDIR/umls/dataset.yaml" ]; then
  python preprocess.py umls
else
    echo umls already prepared
fi

# CoDEx (full text-linked dataset available at https://github.com/tsafavi/codex)
if [ ! -d "$BASEDIR/codex-s" ]; then
    echo Downloading CoDEx-S
    cd $BASEDIR
    curl -L https://www.dropbox.com/s/gzwn7w1pncm3ezg/codex-s.tar.gz?dl=1 -o codex-s.tar.gz
    tar xvf codex-s.tar.gz
else
    echo CoDEx-S already present
fi
if [ ! -f "$BASEDIR/codex-s/dataset.yaml" ]; then
    python preprocess.py codex-s
else
    echo CoDEx-S already prepared
fi

if [ ! -d "$BASEDIR/codex-m" ]; then
    echo Downloading CoDEx-M
    cd $BASEDIR
    curl -L https://www.dropbox.com/s/c0fbzxfpxidmk5h/codex-m.tar.gz?dl=1 -o codex-m.tar.gz
    tar xvf codex-m.tar.gz
else
    echo CoDEx-M already present
fi
if [ ! -f "$BASEDIR/codex-m/dataset.yaml" ]; then
    python preprocess.py codex-m
else
    echo CoDEx-M already prepared
fi

if [ ! -d "$BASEDIR/codex-l" ]; then
    echo Downloading CoDEx-L
    cd $BASEDIR
    curl -L https://www.dropbox.com/s/z94eck49rhmr4nk/codex-l.tar.gz?dl=1 -o codex-l.tar.gz
    tar xvf codex-l.tar.gz
else
    echo CoDEx-L already present
fi
if [ ! -f "$BASEDIR/codex-l/dataset.yaml" ]; then
    python preprocess.py codex-l
else
    echo CoDEx-L already prepared
fi
