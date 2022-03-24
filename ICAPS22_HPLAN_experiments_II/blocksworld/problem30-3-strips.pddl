( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b404 - block
    b733 - block
    b846 - block
    b83 - block
    b376 - block
    b951 - block
    b842 - block
    b790 - block
    b536 - block
    b941 - block
    b96 - block
    b669 - block
    b832 - block
    b633 - block
    b773 - block
    b16 - block
    b905 - block
    b567 - block
    b498 - block
    b943 - block
    b228 - block
    b29 - block
    b559 - block
    b30 - block
    b989 - block
    b651 - block
    b15 - block
    b226 - block
    b243 - block
    b581 - block
    b986 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b404 )
    ( on b733 b404 )
    ( on b846 b733 )
    ( on b83 b846 )
    ( on b376 b83 )
    ( on b951 b376 )
    ( on b842 b951 )
    ( on b790 b842 )
    ( on b536 b790 )
    ( on b941 b536 )
    ( on b96 b941 )
    ( on b669 b96 )
    ( on b832 b669 )
    ( on b633 b832 )
    ( on b773 b633 )
    ( on b16 b773 )
    ( on b905 b16 )
    ( on b567 b905 )
    ( on b498 b567 )
    ( on b943 b498 )
    ( on b228 b943 )
    ( on b29 b228 )
    ( on b559 b29 )
    ( on b30 b559 )
    ( on b989 b30 )
    ( on b651 b989 )
    ( on b15 b651 )
    ( on b226 b15 )
    ( on b243 b226 )
    ( on b581 b243 )
    ( on b986 b581 )
    ( clear b986 )
  )
  ( :goal
    ( and
      ( clear b404 )
    )
  )
)
