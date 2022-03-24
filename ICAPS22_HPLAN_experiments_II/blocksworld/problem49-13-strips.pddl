( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b684 - block
    b584 - block
    b118 - block
    b241 - block
    b522 - block
    b637 - block
    b461 - block
    b663 - block
    b791 - block
    b334 - block
    b266 - block
    b171 - block
    b887 - block
    b291 - block
    b974 - block
    b63 - block
    b147 - block
    b205 - block
    b507 - block
    b192 - block
    b309 - block
    b804 - block
    b282 - block
    b240 - block
    b454 - block
    b940 - block
    b333 - block
    b773 - block
    b142 - block
    b894 - block
    b568 - block
    b465 - block
    b48 - block
    b505 - block
    b944 - block
    b926 - block
    b124 - block
    b318 - block
    b307 - block
    b170 - block
    b993 - block
    b52 - block
    b597 - block
    b148 - block
    b269 - block
    b649 - block
    b490 - block
    b95 - block
    b475 - block
    b265 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b684 )
    ( on b584 b684 )
    ( on b118 b584 )
    ( on b241 b118 )
    ( on b522 b241 )
    ( on b637 b522 )
    ( on b461 b637 )
    ( on b663 b461 )
    ( on b791 b663 )
    ( on b334 b791 )
    ( on b266 b334 )
    ( on b171 b266 )
    ( on b887 b171 )
    ( on b291 b887 )
    ( on b974 b291 )
    ( on b63 b974 )
    ( on b147 b63 )
    ( on b205 b147 )
    ( on b507 b205 )
    ( on b192 b507 )
    ( on b309 b192 )
    ( on b804 b309 )
    ( on b282 b804 )
    ( on b240 b282 )
    ( on b454 b240 )
    ( on b940 b454 )
    ( on b333 b940 )
    ( on b773 b333 )
    ( on b142 b773 )
    ( on b894 b142 )
    ( on b568 b894 )
    ( on b465 b568 )
    ( on b48 b465 )
    ( on b505 b48 )
    ( on b944 b505 )
    ( on b926 b944 )
    ( on b124 b926 )
    ( on b318 b124 )
    ( on b307 b318 )
    ( on b170 b307 )
    ( on b993 b170 )
    ( on b52 b993 )
    ( on b597 b52 )
    ( on b148 b597 )
    ( on b269 b148 )
    ( on b649 b269 )
    ( on b490 b649 )
    ( on b95 b490 )
    ( on b475 b95 )
    ( on b265 b475 )
    ( clear b265 )
  )
  ( :goal
    ( and
      ( clear b684 )
    )
  )
)
