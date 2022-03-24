( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b881 - block
    b72 - block
    b806 - block
    b290 - block
    b178 - block
    b539 - block
    b453 - block
    b309 - block
    b51 - block
    b356 - block
    b83 - block
    b330 - block
    b321 - block
    b402 - block
    b273 - block
    b223 - block
    b55 - block
    b357 - block
    b647 - block
    b143 - block
    b440 - block
    b965 - block
    b243 - block
    b129 - block
    b589 - block
    b163 - block
    b808 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b881 )
    ( on b72 b881 )
    ( on b806 b72 )
    ( on b290 b806 )
    ( on b178 b290 )
    ( on b539 b178 )
    ( on b453 b539 )
    ( on b309 b453 )
    ( on b51 b309 )
    ( on b356 b51 )
    ( on b83 b356 )
    ( on b330 b83 )
    ( on b321 b330 )
    ( on b402 b321 )
    ( on b273 b402 )
    ( on b223 b273 )
    ( on b55 b223 )
    ( on b357 b55 )
    ( on b647 b357 )
    ( on b143 b647 )
    ( on b440 b143 )
    ( on b965 b440 )
    ( on b243 b965 )
    ( on b129 b243 )
    ( on b589 b129 )
    ( on b163 b589 )
    ( on b808 b163 )
    ( clear b808 )
  )
  ( :tasks
    ( Make-26Pile b72 b806 b290 b178 b539 b453 b309 b51 b356 b83 b330 b321 b402 b273 b223 b55 b357 b647 b143 b440 b965 b243 b129 b589 b163 b808 )
  )
)
