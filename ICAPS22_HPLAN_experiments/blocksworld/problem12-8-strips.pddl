( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b469 - block
    b83 - block
    b158 - block
    b309 - block
    b760 - block
    b933 - block
    b943 - block
    b594 - block
    b794 - block
    b886 - block
    b463 - block
    b651 - block
    b761 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b469 )
    ( on b83 b469 )
    ( on b158 b83 )
    ( on b309 b158 )
    ( on b760 b309 )
    ( on b933 b760 )
    ( on b943 b933 )
    ( on b594 b943 )
    ( on b794 b594 )
    ( on b886 b794 )
    ( on b463 b886 )
    ( on b651 b463 )
    ( on b761 b651 )
    ( clear b761 )
  )
  ( :goal
    ( and
      ( clear b469 )
    )
  )
)
