Name: 		myhomepage		
Version:	1
Release:	0
Summary:	This is myhomepage rpm

Group:	        mygroup	
License:	GPL
URL:		http://www.example.com
Source0:	myhomepage-1.tar

%description


%prep
%setup -q


%build


%install
mkdir -p "$RPM_BUILD_ROOT"
cp -R * "$RPM_BUILD_ROOT"

%files
/tmp/user/index.html
%doc



%changelog
