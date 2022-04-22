( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b721 - block
    b807 - block
    b794 - block
    b283 - block
    b976 - block
    b330 - block
    b9 - block
    b587 - block
    b255 - block
    b751 - block
    b979 - block
    b586 - block
    b90 - block
    b997 - block
    b829 - block
    b492 - block
    b900 - block
    b551 - block
    b598 - block
    b269 - block
    b890 - block
    b63 - block
    b75 - block
    b994 - block
    b15 - block
    b769 - block
    b971 - block
    b448 - block
    b10 - block
    b26 - block
    b788 - block
    b680 - block
    b787 - block
    b717 - block
    b266 - block
    b303 - block
    b160 - block
    b402 - block
    b231 - block
    b797 - block
    b665 - block
    b733 - block
    b655 - block
    b902 - block
    b235 - block
    b756 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b721 )
    ( on b807 b721 )
    ( on b794 b807 )
    ( on b283 b794 )
    ( on b976 b283 )
    ( on b330 b976 )
    ( on b9 b330 )
    ( on b587 b9 )
    ( on b255 b587 )
    ( on b751 b255 )
    ( on b979 b751 )
    ( on b586 b979 )
    ( on b90 b586 )
    ( on b997 b90 )
    ( on b829 b997 )
    ( on b492 b829 )
    ( on b900 b492 )
    ( on b551 b900 )
    ( on b598 b551 )
    ( on b269 b598 )
    ( on b890 b269 )
    ( on b63 b890 )
    ( on b75 b63 )
    ( on b994 b75 )
    ( on b15 b994 )
    ( on b769 b15 )
    ( on b971 b769 )
    ( on b448 b971 )
    ( on b10 b448 )
    ( on b26 b10 )
    ( on b788 b26 )
    ( on b680 b788 )
    ( on b787 b680 )
    ( on b717 b787 )
    ( on b266 b717 )
    ( on b303 b266 )
    ( on b160 b303 )
    ( on b402 b160 )
    ( on b231 b402 )
    ( on b797 b231 )
    ( on b665 b797 )
    ( on b733 b665 )
    ( on b655 b733 )
    ( on b902 b655 )
    ( on b235 b902 )
    ( on b756 b235 )
    ( clear b756 )
  )
  ( :goal
    ( and
      ( clear b721 )
    )
  )
)
