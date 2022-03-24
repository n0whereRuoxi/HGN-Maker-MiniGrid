( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b172 - block
    b571 - block
    b135 - block
    b710 - block
    b786 - block
    b756 - block
    b459 - block
    b833 - block
    b784 - block
    b393 - block
    b244 - block
    b18 - block
    b121 - block
    b642 - block
    b414 - block
    b757 - block
    b768 - block
    b606 - block
    b474 - block
    b68 - block
    b361 - block
    b967 - block
    b258 - block
    b25 - block
    b935 - block
    b56 - block
    b247 - block
    b97 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b172 )
    ( on b571 b172 )
    ( on b135 b571 )
    ( on b710 b135 )
    ( on b786 b710 )
    ( on b756 b786 )
    ( on b459 b756 )
    ( on b833 b459 )
    ( on b784 b833 )
    ( on b393 b784 )
    ( on b244 b393 )
    ( on b18 b244 )
    ( on b121 b18 )
    ( on b642 b121 )
    ( on b414 b642 )
    ( on b757 b414 )
    ( on b768 b757 )
    ( on b606 b768 )
    ( on b474 b606 )
    ( on b68 b474 )
    ( on b361 b68 )
    ( on b967 b361 )
    ( on b258 b967 )
    ( on b25 b258 )
    ( on b935 b25 )
    ( on b56 b935 )
    ( on b247 b56 )
    ( on b97 b247 )
    ( clear b97 )
  )
  ( :goal
    ( and
      ( clear b172 )
    )
  )
)
