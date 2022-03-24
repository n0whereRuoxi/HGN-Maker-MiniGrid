( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b182 - block
    b664 - block
    b54 - block
    b743 - block
    b587 - block
    b123 - block
    b558 - block
    b17 - block
    b681 - block
    b840 - block
    b254 - block
    b377 - block
    b439 - block
    b798 - block
    b933 - block
    b639 - block
    b248 - block
    b856 - block
    b401 - block
    b586 - block
    b785 - block
    b531 - block
    b7 - block
    b270 - block
    b613 - block
    b515 - block
    b471 - block
    b820 - block
    b988 - block
    b730 - block
    b646 - block
    b546 - block
    b902 - block
    b765 - block
    b821 - block
    b643 - block
    b710 - block
    b83 - block
    b672 - block
    b637 - block
    b460 - block
    b424 - block
    b800 - block
    b536 - block
    b981 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b182 )
    ( on b664 b182 )
    ( on b54 b664 )
    ( on b743 b54 )
    ( on b587 b743 )
    ( on b123 b587 )
    ( on b558 b123 )
    ( on b17 b558 )
    ( on b681 b17 )
    ( on b840 b681 )
    ( on b254 b840 )
    ( on b377 b254 )
    ( on b439 b377 )
    ( on b798 b439 )
    ( on b933 b798 )
    ( on b639 b933 )
    ( on b248 b639 )
    ( on b856 b248 )
    ( on b401 b856 )
    ( on b586 b401 )
    ( on b785 b586 )
    ( on b531 b785 )
    ( on b7 b531 )
    ( on b270 b7 )
    ( on b613 b270 )
    ( on b515 b613 )
    ( on b471 b515 )
    ( on b820 b471 )
    ( on b988 b820 )
    ( on b730 b988 )
    ( on b646 b730 )
    ( on b546 b646 )
    ( on b902 b546 )
    ( on b765 b902 )
    ( on b821 b765 )
    ( on b643 b821 )
    ( on b710 b643 )
    ( on b83 b710 )
    ( on b672 b83 )
    ( on b637 b672 )
    ( on b460 b637 )
    ( on b424 b460 )
    ( on b800 b424 )
    ( on b536 b800 )
    ( on b981 b536 )
    ( clear b981 )
  )
  ( :tasks
    ( Make-44Pile b664 b54 b743 b587 b123 b558 b17 b681 b840 b254 b377 b439 b798 b933 b639 b248 b856 b401 b586 b785 b531 b7 b270 b613 b515 b471 b820 b988 b730 b646 b546 b902 b765 b821 b643 b710 b83 b672 b637 b460 b424 b800 b536 b981 )
  )
)
