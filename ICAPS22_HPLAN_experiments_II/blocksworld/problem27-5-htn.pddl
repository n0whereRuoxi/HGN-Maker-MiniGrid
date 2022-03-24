( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b874 - block
    b211 - block
    b788 - block
    b244 - block
    b252 - block
    b949 - block
    b173 - block
    b818 - block
    b852 - block
    b530 - block
    b318 - block
    b715 - block
    b492 - block
    b319 - block
    b300 - block
    b17 - block
    b931 - block
    b216 - block
    b518 - block
    b876 - block
    b330 - block
    b832 - block
    b437 - block
    b817 - block
    b183 - block
    b474 - block
    b35 - block
    b922 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b874 )
    ( on b211 b874 )
    ( on b788 b211 )
    ( on b244 b788 )
    ( on b252 b244 )
    ( on b949 b252 )
    ( on b173 b949 )
    ( on b818 b173 )
    ( on b852 b818 )
    ( on b530 b852 )
    ( on b318 b530 )
    ( on b715 b318 )
    ( on b492 b715 )
    ( on b319 b492 )
    ( on b300 b319 )
    ( on b17 b300 )
    ( on b931 b17 )
    ( on b216 b931 )
    ( on b518 b216 )
    ( on b876 b518 )
    ( on b330 b876 )
    ( on b832 b330 )
    ( on b437 b832 )
    ( on b817 b437 )
    ( on b183 b817 )
    ( on b474 b183 )
    ( on b35 b474 )
    ( on b922 b35 )
    ( clear b922 )
  )
  ( :tasks
    ( Make-27Pile b211 b788 b244 b252 b949 b173 b818 b852 b530 b318 b715 b492 b319 b300 b17 b931 b216 b518 b876 b330 b832 b437 b817 b183 b474 b35 b922 )
  )
)
