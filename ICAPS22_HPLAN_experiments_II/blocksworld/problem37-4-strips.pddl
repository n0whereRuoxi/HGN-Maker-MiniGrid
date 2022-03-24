( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b926 - block
    b467 - block
    b476 - block
    b825 - block
    b725 - block
    b881 - block
    b107 - block
    b855 - block
    b405 - block
    b13 - block
    b758 - block
    b886 - block
    b448 - block
    b967 - block
    b608 - block
    b226 - block
    b614 - block
    b652 - block
    b427 - block
    b244 - block
    b511 - block
    b447 - block
    b282 - block
    b455 - block
    b212 - block
    b141 - block
    b586 - block
    b930 - block
    b956 - block
    b589 - block
    b154 - block
    b234 - block
    b413 - block
    b256 - block
    b241 - block
    b298 - block
    b524 - block
    b750 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b926 )
    ( on b467 b926 )
    ( on b476 b467 )
    ( on b825 b476 )
    ( on b725 b825 )
    ( on b881 b725 )
    ( on b107 b881 )
    ( on b855 b107 )
    ( on b405 b855 )
    ( on b13 b405 )
    ( on b758 b13 )
    ( on b886 b758 )
    ( on b448 b886 )
    ( on b967 b448 )
    ( on b608 b967 )
    ( on b226 b608 )
    ( on b614 b226 )
    ( on b652 b614 )
    ( on b427 b652 )
    ( on b244 b427 )
    ( on b511 b244 )
    ( on b447 b511 )
    ( on b282 b447 )
    ( on b455 b282 )
    ( on b212 b455 )
    ( on b141 b212 )
    ( on b586 b141 )
    ( on b930 b586 )
    ( on b956 b930 )
    ( on b589 b956 )
    ( on b154 b589 )
    ( on b234 b154 )
    ( on b413 b234 )
    ( on b256 b413 )
    ( on b241 b256 )
    ( on b298 b241 )
    ( on b524 b298 )
    ( on b750 b524 )
    ( clear b750 )
  )
  ( :goal
    ( and
      ( clear b926 )
    )
  )
)
