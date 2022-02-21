( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b63 - block
    b86 - block
    b21 - block
    b51 - block
    b927 - block
    b346 - block
    b549 - block
    b428 - block
    b932 - block
    b148 - block
    b191 - block
    b780 - block
    b463 - block
    b361 - block
    b62 - block
    b775 - block
    b516 - block
    b705 - block
    b703 - block
    b116 - block
    b663 - block
    b913 - block
    b488 - block
    b979 - block
    b441 - block
    b457 - block
    b95 - block
    b738 - block
    b468 - block
    b350 - block
    b525 - block
    b700 - block
    b439 - block
    b431 - block
    b338 - block
    b69 - block
    b495 - block
    b484 - block
    b823 - block
    b344 - block
    b177 - block
    b636 - block
    b385 - block
    b882 - block
    b587 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b63 )
    ( on b86 b63 )
    ( on b21 b86 )
    ( on b51 b21 )
    ( on b927 b51 )
    ( on b346 b927 )
    ( on b549 b346 )
    ( on b428 b549 )
    ( on b932 b428 )
    ( on b148 b932 )
    ( on b191 b148 )
    ( on b780 b191 )
    ( on b463 b780 )
    ( on b361 b463 )
    ( on b62 b361 )
    ( on b775 b62 )
    ( on b516 b775 )
    ( on b705 b516 )
    ( on b703 b705 )
    ( on b116 b703 )
    ( on b663 b116 )
    ( on b913 b663 )
    ( on b488 b913 )
    ( on b979 b488 )
    ( on b441 b979 )
    ( on b457 b441 )
    ( on b95 b457 )
    ( on b738 b95 )
    ( on b468 b738 )
    ( on b350 b468 )
    ( on b525 b350 )
    ( on b700 b525 )
    ( on b439 b700 )
    ( on b431 b439 )
    ( on b338 b431 )
    ( on b69 b338 )
    ( on b495 b69 )
    ( on b484 b495 )
    ( on b823 b484 )
    ( on b344 b823 )
    ( on b177 b344 )
    ( on b636 b177 )
    ( on b385 b636 )
    ( on b882 b385 )
    ( on b587 b882 )
    ( clear b587 )
  )
  ( :goal
    ( and
      ( clear b63 )
    )
  )
)
