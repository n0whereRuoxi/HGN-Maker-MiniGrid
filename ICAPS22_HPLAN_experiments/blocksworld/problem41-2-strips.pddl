( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b541 - block
    b732 - block
    b251 - block
    b97 - block
    b12 - block
    b181 - block
    b673 - block
    b196 - block
    b153 - block
    b800 - block
    b185 - block
    b782 - block
    b135 - block
    b678 - block
    b735 - block
    b65 - block
    b235 - block
    b670 - block
    b677 - block
    b331 - block
    b570 - block
    b895 - block
    b717 - block
    b935 - block
    b102 - block
    b669 - block
    b663 - block
    b610 - block
    b667 - block
    b342 - block
    b870 - block
    b616 - block
    b400 - block
    b385 - block
    b873 - block
    b190 - block
    b141 - block
    b952 - block
    b947 - block
    b860 - block
    b864 - block
    b720 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b541 )
    ( on b732 b541 )
    ( on b251 b732 )
    ( on b97 b251 )
    ( on b12 b97 )
    ( on b181 b12 )
    ( on b673 b181 )
    ( on b196 b673 )
    ( on b153 b196 )
    ( on b800 b153 )
    ( on b185 b800 )
    ( on b782 b185 )
    ( on b135 b782 )
    ( on b678 b135 )
    ( on b735 b678 )
    ( on b65 b735 )
    ( on b235 b65 )
    ( on b670 b235 )
    ( on b677 b670 )
    ( on b331 b677 )
    ( on b570 b331 )
    ( on b895 b570 )
    ( on b717 b895 )
    ( on b935 b717 )
    ( on b102 b935 )
    ( on b669 b102 )
    ( on b663 b669 )
    ( on b610 b663 )
    ( on b667 b610 )
    ( on b342 b667 )
    ( on b870 b342 )
    ( on b616 b870 )
    ( on b400 b616 )
    ( on b385 b400 )
    ( on b873 b385 )
    ( on b190 b873 )
    ( on b141 b190 )
    ( on b952 b141 )
    ( on b947 b952 )
    ( on b860 b947 )
    ( on b864 b860 )
    ( on b720 b864 )
    ( clear b720 )
  )
  ( :goal
    ( and
      ( clear b541 )
    )
  )
)
