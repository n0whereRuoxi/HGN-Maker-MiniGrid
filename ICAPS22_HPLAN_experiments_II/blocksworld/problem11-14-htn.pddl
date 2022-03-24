( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b242 - block
    b532 - block
    b259 - block
    b718 - block
    b98 - block
    b237 - block
    b884 - block
    b393 - block
    b465 - block
    b915 - block
    b732 - block
    b820 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b242 )
    ( on b532 b242 )
    ( on b259 b532 )
    ( on b718 b259 )
    ( on b98 b718 )
    ( on b237 b98 )
    ( on b884 b237 )
    ( on b393 b884 )
    ( on b465 b393 )
    ( on b915 b465 )
    ( on b732 b915 )
    ( on b820 b732 )
    ( clear b820 )
  )
  ( :tasks
    ( Make-11Pile b532 b259 b718 b98 b237 b884 b393 b465 b915 b732 b820 )
  )
)
