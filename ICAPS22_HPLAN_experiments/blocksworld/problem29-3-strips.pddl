( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b318 - block
    b702 - block
    b691 - block
    b368 - block
    b830 - block
    b912 - block
    b213 - block
    b629 - block
    b164 - block
    b588 - block
    b30 - block
    b953 - block
    b787 - block
    b906 - block
    b800 - block
    b785 - block
    b103 - block
    b788 - block
    b68 - block
    b513 - block
    b738 - block
    b748 - block
    b865 - block
    b37 - block
    b769 - block
    b436 - block
    b635 - block
    b806 - block
    b647 - block
    b622 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b318 )
    ( on b702 b318 )
    ( on b691 b702 )
    ( on b368 b691 )
    ( on b830 b368 )
    ( on b912 b830 )
    ( on b213 b912 )
    ( on b629 b213 )
    ( on b164 b629 )
    ( on b588 b164 )
    ( on b30 b588 )
    ( on b953 b30 )
    ( on b787 b953 )
    ( on b906 b787 )
    ( on b800 b906 )
    ( on b785 b800 )
    ( on b103 b785 )
    ( on b788 b103 )
    ( on b68 b788 )
    ( on b513 b68 )
    ( on b738 b513 )
    ( on b748 b738 )
    ( on b865 b748 )
    ( on b37 b865 )
    ( on b769 b37 )
    ( on b436 b769 )
    ( on b635 b436 )
    ( on b806 b635 )
    ( on b647 b806 )
    ( on b622 b647 )
    ( clear b622 )
  )
  ( :goal
    ( and
      ( clear b318 )
    )
  )
)
