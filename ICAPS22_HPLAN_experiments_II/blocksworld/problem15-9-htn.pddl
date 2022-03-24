( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b705 - block
    b399 - block
    b856 - block
    b529 - block
    b785 - block
    b151 - block
    b631 - block
    b859 - block
    b712 - block
    b678 - block
    b585 - block
    b198 - block
    b933 - block
    b876 - block
    b473 - block
    b809 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b705 )
    ( on b399 b705 )
    ( on b856 b399 )
    ( on b529 b856 )
    ( on b785 b529 )
    ( on b151 b785 )
    ( on b631 b151 )
    ( on b859 b631 )
    ( on b712 b859 )
    ( on b678 b712 )
    ( on b585 b678 )
    ( on b198 b585 )
    ( on b933 b198 )
    ( on b876 b933 )
    ( on b473 b876 )
    ( on b809 b473 )
    ( clear b809 )
  )
  ( :tasks
    ( Make-15Pile b399 b856 b529 b785 b151 b631 b859 b712 b678 b585 b198 b933 b876 b473 b809 )
  )
)
