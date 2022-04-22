( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b312 - block
    b657 - block
    b683 - block
    b985 - block
    b596 - block
    b483 - block
    b831 - block
    b411 - block
    b632 - block
    b594 - block
    b730 - block
    b576 - block
    b340 - block
    b573 - block
    b748 - block
    b804 - block
    b499 - block
    b234 - block
    b836 - block
    b940 - block
    b830 - block
    b602 - block
    b428 - block
    b942 - block
    b307 - block
    b68 - block
    b226 - block
    b692 - block
    b636 - block
    b567 - block
    b859 - block
    b108 - block
    b552 - block
    b720 - block
    b935 - block
    b622 - block
    b604 - block
    b256 - block
    b574 - block
    b629 - block
    b865 - block
    b899 - block
    b465 - block
    b209 - block
    b197 - block
    b623 - block
    b386 - block
    b778 - block
    b219 - block
    b263 - block
    b337 - block
    b584 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b312 )
    ( on b657 b312 )
    ( on b683 b657 )
    ( on b985 b683 )
    ( on b596 b985 )
    ( on b483 b596 )
    ( on b831 b483 )
    ( on b411 b831 )
    ( on b632 b411 )
    ( on b594 b632 )
    ( on b730 b594 )
    ( on b576 b730 )
    ( on b340 b576 )
    ( on b573 b340 )
    ( on b748 b573 )
    ( on b804 b748 )
    ( on b499 b804 )
    ( on b234 b499 )
    ( on b836 b234 )
    ( on b940 b836 )
    ( on b830 b940 )
    ( on b602 b830 )
    ( on b428 b602 )
    ( on b942 b428 )
    ( on b307 b942 )
    ( on b68 b307 )
    ( on b226 b68 )
    ( on b692 b226 )
    ( on b636 b692 )
    ( on b567 b636 )
    ( on b859 b567 )
    ( on b108 b859 )
    ( on b552 b108 )
    ( on b720 b552 )
    ( on b935 b720 )
    ( on b622 b935 )
    ( on b604 b622 )
    ( on b256 b604 )
    ( on b574 b256 )
    ( on b629 b574 )
    ( on b865 b629 )
    ( on b899 b865 )
    ( on b465 b899 )
    ( on b209 b465 )
    ( on b197 b209 )
    ( on b623 b197 )
    ( on b386 b623 )
    ( on b778 b386 )
    ( on b219 b778 )
    ( on b263 b219 )
    ( on b337 b263 )
    ( on b584 b337 )
    ( clear b584 )
  )
  ( :goal
    ( and
      ( clear b312 )
    )
  )
)
