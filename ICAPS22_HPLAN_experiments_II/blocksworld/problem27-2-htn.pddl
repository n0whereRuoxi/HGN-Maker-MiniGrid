( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b308 - block
    b521 - block
    b674 - block
    b656 - block
    b324 - block
    b583 - block
    b634 - block
    b505 - block
    b646 - block
    b689 - block
    b474 - block
    b851 - block
    b170 - block
    b788 - block
    b457 - block
    b321 - block
    b618 - block
    b60 - block
    b81 - block
    b622 - block
    b522 - block
    b932 - block
    b417 - block
    b928 - block
    b535 - block
    b143 - block
    b129 - block
    b89 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b308 )
    ( on b521 b308 )
    ( on b674 b521 )
    ( on b656 b674 )
    ( on b324 b656 )
    ( on b583 b324 )
    ( on b634 b583 )
    ( on b505 b634 )
    ( on b646 b505 )
    ( on b689 b646 )
    ( on b474 b689 )
    ( on b851 b474 )
    ( on b170 b851 )
    ( on b788 b170 )
    ( on b457 b788 )
    ( on b321 b457 )
    ( on b618 b321 )
    ( on b60 b618 )
    ( on b81 b60 )
    ( on b622 b81 )
    ( on b522 b622 )
    ( on b932 b522 )
    ( on b417 b932 )
    ( on b928 b417 )
    ( on b535 b928 )
    ( on b143 b535 )
    ( on b129 b143 )
    ( on b89 b129 )
    ( clear b89 )
  )
  ( :tasks
    ( Make-27Pile b521 b674 b656 b324 b583 b634 b505 b646 b689 b474 b851 b170 b788 b457 b321 b618 b60 b81 b622 b522 b932 b417 b928 b535 b143 b129 b89 )
  )
)
