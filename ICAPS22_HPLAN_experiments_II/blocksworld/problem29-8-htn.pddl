( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b29 - block
    b529 - block
    b564 - block
    b412 - block
    b616 - block
    b761 - block
    b429 - block
    b747 - block
    b606 - block
    b659 - block
    b954 - block
    b897 - block
    b319 - block
    b892 - block
    b675 - block
    b383 - block
    b284 - block
    b175 - block
    b648 - block
    b795 - block
    b523 - block
    b539 - block
    b615 - block
    b33 - block
    b752 - block
    b573 - block
    b14 - block
    b350 - block
    b689 - block
    b21 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b29 )
    ( on b529 b29 )
    ( on b564 b529 )
    ( on b412 b564 )
    ( on b616 b412 )
    ( on b761 b616 )
    ( on b429 b761 )
    ( on b747 b429 )
    ( on b606 b747 )
    ( on b659 b606 )
    ( on b954 b659 )
    ( on b897 b954 )
    ( on b319 b897 )
    ( on b892 b319 )
    ( on b675 b892 )
    ( on b383 b675 )
    ( on b284 b383 )
    ( on b175 b284 )
    ( on b648 b175 )
    ( on b795 b648 )
    ( on b523 b795 )
    ( on b539 b523 )
    ( on b615 b539 )
    ( on b33 b615 )
    ( on b752 b33 )
    ( on b573 b752 )
    ( on b14 b573 )
    ( on b350 b14 )
    ( on b689 b350 )
    ( on b21 b689 )
    ( clear b21 )
  )
  ( :tasks
    ( Make-29Pile b529 b564 b412 b616 b761 b429 b747 b606 b659 b954 b897 b319 b892 b675 b383 b284 b175 b648 b795 b523 b539 b615 b33 b752 b573 b14 b350 b689 b21 )
  )
)
