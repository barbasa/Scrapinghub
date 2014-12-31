use 5.018002;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME              => 'Scrapinghub',
    VERSION_FROM      => 'lib/Scrapinghub/Client.pm', # finds $VERSION
    PREREQ_PM         => {
        'Test::More'    => 0,
        'Test::Exception' => 0,
        'Moo'           => 0,
        'MooX::Traits'  => 0,
    },
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM  => 'lib/Scrapinghub/Client.pm', # retrieve abstract from module
       AUTHOR         => 'Fabio Ponciroli <ponch78@gmail.com>') : ()),
);
