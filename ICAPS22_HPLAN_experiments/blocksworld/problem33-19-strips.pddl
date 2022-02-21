( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b667 - block
    b608 - block
    b365 - block
    b843 - block
    b226 - block
    b511 - block
    b57 - block
    b173 - block
    b854 - block
    b970 - block
    b350 - block
    b991 - block
    b797 - block
    b348 - block
    b898 - block
    b211 - block
    b336 - block
    b594 - block
    b209 - block
    b120 - block
    b583 - block
    b367 - block
    b807 - block
    b33 - block
    b397 - block
    b96 - block
    b912 - block
    b343 - block
    b445 - block
    b140 - block
    b8 - block
    b64 - block
    b873 - block
    b766 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b667 )
    ( on b608 b667 )
    ( on b365 b608 )
    ( on b843 b365 )
    ( on b226 b843 )
    ( on b511 b226 )
    ( on b57 b511 )
    ( on b173 b57 )
    ( on b854 b173 )
    ( on b970 b854 )
    ( on b350 b970 )
    ( on b991 b350 )
    ( on b797 b991 )
    ( on b348 b797 )
    ( on b898 b348 )
    ( on b211 b898 )
    ( on b336 b211 )
    ( on b594 b336 )
    ( on b209 b594 )
    ( on b120 b209 )
    ( on b583 b120 )
    ( on b367 b583 )
    ( on b807 b367 )
    ( on b33 b807 )
    ( on b397 b33 )
    ( on b96 b397 )
    ( on b912 b96 )
    ( on b343 b912 )
    ( on b445 b343 )
    ( on b140 b445 )
    ( on b8 b140 )
    ( on b64 b8 )
    ( on b873 b64 )
    ( on b766 b873 )
    ( clear b766 )
  )
  ( :goal
    ( and
      ( clear b667 )
    )
  )
)
