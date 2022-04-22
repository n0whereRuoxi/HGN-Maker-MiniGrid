( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b63 - block
    b124 - block
    b498 - block
    b121 - block
    b864 - block
    b406 - block
    b398 - block
    b625 - block
    b975 - block
    b303 - block
    b522 - block
    b939 - block
    b29 - block
    b549 - block
    b492 - block
    b231 - block
    b799 - block
    b913 - block
    b728 - block
    b710 - block
    b287 - block
    b332 - block
    b698 - block
    b681 - block
    b737 - block
    b277 - block
    b547 - block
    b27 - block
    b381 - block
    b540 - block
    b260 - block
    b328 - block
    b257 - block
    b930 - block
    b969 - block
    b583 - block
    b359 - block
    b349 - block
    b687 - block
    b802 - block
    b358 - block
    b431 - block
    b516 - block
    b481 - block
    b808 - block
    b553 - block
    b530 - block
    b612 - block
    b734 - block
    b788 - block
    b774 - block
    b330 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b63 )
    ( on b124 b63 )
    ( on b498 b124 )
    ( on b121 b498 )
    ( on b864 b121 )
    ( on b406 b864 )
    ( on b398 b406 )
    ( on b625 b398 )
    ( on b975 b625 )
    ( on b303 b975 )
    ( on b522 b303 )
    ( on b939 b522 )
    ( on b29 b939 )
    ( on b549 b29 )
    ( on b492 b549 )
    ( on b231 b492 )
    ( on b799 b231 )
    ( on b913 b799 )
    ( on b728 b913 )
    ( on b710 b728 )
    ( on b287 b710 )
    ( on b332 b287 )
    ( on b698 b332 )
    ( on b681 b698 )
    ( on b737 b681 )
    ( on b277 b737 )
    ( on b547 b277 )
    ( on b27 b547 )
    ( on b381 b27 )
    ( on b540 b381 )
    ( on b260 b540 )
    ( on b328 b260 )
    ( on b257 b328 )
    ( on b930 b257 )
    ( on b969 b930 )
    ( on b583 b969 )
    ( on b359 b583 )
    ( on b349 b359 )
    ( on b687 b349 )
    ( on b802 b687 )
    ( on b358 b802 )
    ( on b431 b358 )
    ( on b516 b431 )
    ( on b481 b516 )
    ( on b808 b481 )
    ( on b553 b808 )
    ( on b530 b553 )
    ( on b612 b530 )
    ( on b734 b612 )
    ( on b788 b734 )
    ( on b774 b788 )
    ( on b330 b774 )
    ( clear b330 )
  )
  ( :goal
    ( and
      ( clear b63 )
    )
  )
)
