( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b83 - block
    b198 - block
    b917 - block
    b972 - block
    b538 - block
    b622 - block
    b965 - block
    b15 - block
    b650 - block
    b50 - block
    b579 - block
    b612 - block
    b153 - block
    b847 - block
    b937 - block
    b955 - block
    b444 - block
    b159 - block
    b353 - block
    b939 - block
    b387 - block
    b48 - block
    b344 - block
    b532 - block
    b865 - block
    b61 - block
    b80 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b83 )
    ( on b198 b83 )
    ( on b917 b198 )
    ( on b972 b917 )
    ( on b538 b972 )
    ( on b622 b538 )
    ( on b965 b622 )
    ( on b15 b965 )
    ( on b650 b15 )
    ( on b50 b650 )
    ( on b579 b50 )
    ( on b612 b579 )
    ( on b153 b612 )
    ( on b847 b153 )
    ( on b937 b847 )
    ( on b955 b937 )
    ( on b444 b955 )
    ( on b159 b444 )
    ( on b353 b159 )
    ( on b939 b353 )
    ( on b387 b939 )
    ( on b48 b387 )
    ( on b344 b48 )
    ( on b532 b344 )
    ( on b865 b532 )
    ( on b61 b865 )
    ( on b80 b61 )
    ( clear b80 )
  )
  ( :tasks
    ( Make-26Pile b198 b917 b972 b538 b622 b965 b15 b650 b50 b579 b612 b153 b847 b937 b955 b444 b159 b353 b939 b387 b48 b344 b532 b865 b61 b80 )
  )
)
