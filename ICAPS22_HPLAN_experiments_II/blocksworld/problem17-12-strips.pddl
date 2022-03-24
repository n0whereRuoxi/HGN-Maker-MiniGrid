( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b652 - block
    b463 - block
    b48 - block
    b413 - block
    b714 - block
    b660 - block
    b191 - block
    b267 - block
    b107 - block
    b330 - block
    b412 - block
    b795 - block
    b764 - block
    b47 - block
    b143 - block
    b733 - block
    b884 - block
    b105 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b652 )
    ( on b463 b652 )
    ( on b48 b463 )
    ( on b413 b48 )
    ( on b714 b413 )
    ( on b660 b714 )
    ( on b191 b660 )
    ( on b267 b191 )
    ( on b107 b267 )
    ( on b330 b107 )
    ( on b412 b330 )
    ( on b795 b412 )
    ( on b764 b795 )
    ( on b47 b764 )
    ( on b143 b47 )
    ( on b733 b143 )
    ( on b884 b733 )
    ( on b105 b884 )
    ( clear b105 )
  )
  ( :goal
    ( and
      ( clear b652 )
    )
  )
)
