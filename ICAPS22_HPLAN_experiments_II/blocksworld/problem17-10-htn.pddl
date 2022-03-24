( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b128 - block
    b340 - block
    b332 - block
    b582 - block
    b725 - block
    b321 - block
    b522 - block
    b911 - block
    b764 - block
    b894 - block
    b461 - block
    b898 - block
    b459 - block
    b222 - block
    b927 - block
    b449 - block
    b130 - block
    b618 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b128 )
    ( on b340 b128 )
    ( on b332 b340 )
    ( on b582 b332 )
    ( on b725 b582 )
    ( on b321 b725 )
    ( on b522 b321 )
    ( on b911 b522 )
    ( on b764 b911 )
    ( on b894 b764 )
    ( on b461 b894 )
    ( on b898 b461 )
    ( on b459 b898 )
    ( on b222 b459 )
    ( on b927 b222 )
    ( on b449 b927 )
    ( on b130 b449 )
    ( on b618 b130 )
    ( clear b618 )
  )
  ( :tasks
    ( Make-17Pile b340 b332 b582 b725 b321 b522 b911 b764 b894 b461 b898 b459 b222 b927 b449 b130 b618 )
  )
)
