( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b960 - block
    b917 - block
    b378 - block
    b725 - block
    b463 - block
    b866 - block
    b464 - block
    b955 - block
    b826 - block
    b889 - block
    b581 - block
    b450 - block
    b848 - block
    b490 - block
    b896 - block
    b907 - block
    b616 - block
    b272 - block
    b633 - block
    b503 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b960 )
    ( on b917 b960 )
    ( on b378 b917 )
    ( on b725 b378 )
    ( on b463 b725 )
    ( on b866 b463 )
    ( on b464 b866 )
    ( on b955 b464 )
    ( on b826 b955 )
    ( on b889 b826 )
    ( on b581 b889 )
    ( on b450 b581 )
    ( on b848 b450 )
    ( on b490 b848 )
    ( on b896 b490 )
    ( on b907 b896 )
    ( on b616 b907 )
    ( on b272 b616 )
    ( on b633 b272 )
    ( on b503 b633 )
    ( clear b503 )
  )
  ( :goal
    ( and
      ( clear b960 )
    )
  )
)
