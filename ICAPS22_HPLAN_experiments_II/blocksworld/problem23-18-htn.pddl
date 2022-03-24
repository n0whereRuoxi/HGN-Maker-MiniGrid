( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b330 - block
    b990 - block
    b85 - block
    b700 - block
    b722 - block
    b846 - block
    b680 - block
    b752 - block
    b156 - block
    b717 - block
    b688 - block
    b669 - block
    b726 - block
    b673 - block
    b476 - block
    b369 - block
    b546 - block
    b537 - block
    b311 - block
    b187 - block
    b844 - block
    b478 - block
    b33 - block
    b320 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b330 )
    ( on b990 b330 )
    ( on b85 b990 )
    ( on b700 b85 )
    ( on b722 b700 )
    ( on b846 b722 )
    ( on b680 b846 )
    ( on b752 b680 )
    ( on b156 b752 )
    ( on b717 b156 )
    ( on b688 b717 )
    ( on b669 b688 )
    ( on b726 b669 )
    ( on b673 b726 )
    ( on b476 b673 )
    ( on b369 b476 )
    ( on b546 b369 )
    ( on b537 b546 )
    ( on b311 b537 )
    ( on b187 b311 )
    ( on b844 b187 )
    ( on b478 b844 )
    ( on b33 b478 )
    ( on b320 b33 )
    ( clear b320 )
  )
  ( :tasks
    ( Make-23Pile b990 b85 b700 b722 b846 b680 b752 b156 b717 b688 b669 b726 b673 b476 b369 b546 b537 b311 b187 b844 b478 b33 b320 )
  )
)
