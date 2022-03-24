( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b126 - block
    b997 - block
    b658 - block
    b364 - block
    b386 - block
    b222 - block
    b547 - block
    b666 - block
    b54 - block
    b371 - block
    b731 - block
    b460 - block
    b794 - block
    b738 - block
    b902 - block
    b227 - block
    b21 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b126 )
    ( on b997 b126 )
    ( on b658 b997 )
    ( on b364 b658 )
    ( on b386 b364 )
    ( on b222 b386 )
    ( on b547 b222 )
    ( on b666 b547 )
    ( on b54 b666 )
    ( on b371 b54 )
    ( on b731 b371 )
    ( on b460 b731 )
    ( on b794 b460 )
    ( on b738 b794 )
    ( on b902 b738 )
    ( on b227 b902 )
    ( on b21 b227 )
    ( clear b21 )
  )
  ( :tasks
    ( Make-16Pile b997 b658 b364 b386 b222 b547 b666 b54 b371 b731 b460 b794 b738 b902 b227 b21 )
  )
)
